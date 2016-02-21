import domReady from 'domready'
import viewloader from 'viewloader'
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import Immutable from 'immutable'
import template from 'formalist-standard-react'

import Perf from 'react-addons-perf'
window.Perf = Perf

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
          Perf.stop()
          Perf.printInclusive()
          Perf.printExclusive()
          Perf.printWasted()
          Perf.printDOM()
        }, 1000)
      })
    })
  }

  render() {
    let form = this.props.form
    return (
      <div className="appWrapper">
        <form method="post" action="">
          {form.render()}
          <input name="data" type="hidden" value={JSON.stringify(this.state.formState.toJS())}/>
          <button>Submit form</button>
        </form>
        <pre><code>{JSON.stringify(this.state.formState.toJS(), null, 2)}</code></pre>
      </div>
    )
  }
}

/**
 * Object for holding our `viewloader` views
 */
const views = {
  form: (el, ast) => {
    let data = JSON.parse(ast)
    let configuredTemplate = template()
    let form = configuredTemplate(data)
    Perf.start()
    ReactDOM.render(<App form={form} />, el)
    Perf.stop()
    Perf.printInclusive()
    Perf.printExclusive()
    Perf.printWasted()
    Perf.printDOM()
  }
}

/**
 * Kick things off on domReady
 */
domReady(() => {
  viewloader.execute(views);
})

