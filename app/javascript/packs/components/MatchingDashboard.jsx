import React, { Children, useState } from 'react'

import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Container from '@material-ui/core/Container'
import CssBaseline from '@material-ui/core/CssBaseline'
import Grid from '@material-ui/core/Grid'
import Paper from '@material-ui/core/Paper'

import PairingList from './PairingList'
import UserList from './UserList'
import { useStyles } from '../styles'

function MatchingDashboard ({ initialData, api }) {
  const styles = useStyles()
  const [data, setData] = useState(initialData)

  const selectionsInit = { clientId: null, expertId: null }
  const [selections, setSelections] = useState(selectionsInit)

  const commitPairing = async update => {
    const resp = await api.createPairing(update)
    const data = await api.getIndex()
    setData(data)
  }

  const handleSelection = (idType, id) => {
    const update = { ...selections, [idType]: id }
    setSelections(update)

    if (update.clientId && update.expertId) {
      commitPairing(update)
      setSelections(selectionsInit)
    }
  }

  return (
    <>
      <CssBaseline />
      <Container maxWidth='md'>
        <Grid container spacing={3} className={styles.root}>
          <Grid item xs={4}>
            <PairingList pairings={data.pairings} />
          </Grid>

          <Grid item xs={4}>
            <UserList
              title='Clients'
              idType='clientId'
              users={data.clients}
              selections={selections}
              setSelection={handleSelection}
            />
          </Grid>

          <Grid item xs={4}>
            <UserList
              title='Experts'
              idType='expertId'
              users={data.experts}
              selections={selections}
              setSelection={handleSelection}
            />
          </Grid>
        </Grid>
      </Container>
    </>
  )
}

export default MatchingDashboard
