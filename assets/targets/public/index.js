import domReady from 'domready'
import viewloader from 'viewloader'
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import Immutable from 'immutable'
import composeForm from 'formalist-compose'
import template from 'formalist-standard-react'
import serialize from 'formalist-serialize-react'

import Perf from 'react-addons-perf'
window.Perf = Perf

const showPerf = false
/**
 * Simple wrapper to create the form outer
 */
export default class App extends Component {
  constructor(props) {
    super(props)
    let form = this.props.form
    this.state = {
      formState: form.store.getState()
    }
  }

  componentWillMount() {
    let form = this.props.form
    form.store.subscribe(() => {
      Perf.start()
      this.setState({
        formState: form.store.getState()
      }, () => {
        setTimeout(() => {
          if (showPerf) {
            Perf.stop()
            Perf.printInclusive()
            Perf.printExclusive()
            Perf.printWasted()
            Perf.printOperations()
          }
        }, 1000)
      })
    })
  }

  render() {
    let form = this.props.form
    let serializedForm = composeForm(serialize())
    return (
      <div className="appWrapper">
        <form method="post" action="">
          {form.render()}
          <button>Submit form</button>
          {serializedForm(this.state.formState.toJS()).render()}
        </form>
      </div>
    )
  }
}


const formConfig = {
  fields: {
    selectionField: {
      components: [
        {
          name: 'author',
          component: ({option}) => (<div><strong>{option.label}</strong>, {option.description}</div>)
        }
      ]
    },
    multiSelectionField: {
      components: [
        {
          name: 'author',
          component: ({option}) => (<div><strong>{option.label}</strong>, {option.description}</div>)
        }
      ]
    }
  }
}

/**
 * Object for holding our `viewloader` views
 */
const views = {
  form: (el, props) => {
    let configuredTemplate = template({}, formConfig)
    let form = configuredTemplate(props.ast)

    Perf.start()
    ReactDOM.render(<App form={form} />, el)
    Perf.stop()
    if (showPerf) {
      Perf.stop()
      Perf.printInclusive()
      Perf.printExclusive()
      Perf.printWasted()
      Perf.printOperations()
    }
  }
}

/**
 * Kick things off on domReady
 */
domReady(() => {
  viewloader.execute(views);
})

