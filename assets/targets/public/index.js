import domReady from 'domready'
import viewloader from 'viewloader'
import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import Immutable from 'immutable'
import composeForm from 'formalist-compose'
import template from 'formalist-standard-react'

import Perf from 'react-addons-perf'
window.Perf = Perf

import serialize from 'formalist-serialize-react'

/**
 * Simple wrapper to create the form outer
 */
export default class App extends Component {
  constructor (props) {
    super(props)
    let form = this.props.form
    this.state = {
      formState: form.store.getState(),
      submitting: false
    }
  }

  componentWillMount () {
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

  componentDidUpdate (prevProps, prevState) {
    if (this.state.submitting) {
      let formNode = ReactDOM.findDOMNode(this.refs.form)
      formNode.submit()
    }
  }

  onSubmit (e) {
    if (!this.state.submitting) {
      e.preventDefault()
      this.setState({
        submitting: true
      })
    }
  }

  render () {
    let form = this.props.form

    return (
      <div className="appWrapper">
        <form ref="form" method="post" action="" onSubmit={this.onSubmit.bind(this)}>
          {form.render()}
          <button>Submit form</button>
          {(this.state.submitting) ? composeForm(serialize)(this.state.formState).render() : null}
        </form>
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

