class Api {
  constructor ({ urls, csrfToken }) {
    this.urls = urls
    this.headers = {
      'X-CSRF-TOKEN': csrfToken,
      'Content-Type': 'application/json'
    }
  }

  async getIndex () {
    try {
      const resp = await window.fetch(this.urls.home, {
        method: 'GET',
        headers: this.headers
      })

      return await resp.json()
    } catch {
      console.error(`Failed retrieving pairings`)
      return null
    }
  }

  async createPairing ({ clientId, expertId }) {
    try {
      const resp = await window.fetch(this.urls.pairings, {
        method: 'POST',
        headers: this.headers,
        body: JSON.stringify({
          pairing: { client_id: clientId, expert_id: expertId }
        })
      })
      return await resp.json()
    } catch {
      console.error(`Failed creating pairing: ${clientId} and ${expertId}`)
      return null
    }
  }
}

export { Api }
