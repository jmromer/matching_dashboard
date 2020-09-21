import React from 'react'
import ReactDOM from 'react-dom'

import { Api } from './api'
import MatchingDashboard from './components/MatchingDashboard'

document.addEventListener('DOMContentLoaded', async () => {
  const csrfToken = document.querySelector('[name=csrf-token]').content
  const urls = Object.assign({}, document.getElementById('urls').dataset)
  const data = JSON.parse(document.getElementById('json').text)
  const api = new Api({ urls, csrfToken })

  ReactDOM.render(
    <MatchingDashboard initialData={data} api={api} />,
    document.getElementById('root')
  )
})
