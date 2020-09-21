import React, { Children, useState } from 'react'

import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Paper from '@material-ui/core/Paper'

import { useStyles } from '../styles'

function PairingList ({ pairings }) {
  const styles = useStyles()
  return (
    <>
      <Paper className={styles.header}>Matched Pairs</Paper>
      {pairings.map(({ id, client, expert }) => (
        <Card key={id} className={styles.card}>
          <CardContent className={styles.cardContent}>
            <div>client: {client.name}</div>
            <div>expert: {expert.name}</div>
          </CardContent>
        </Card>
      ))}
    </>
  )
}

export default PairingList
