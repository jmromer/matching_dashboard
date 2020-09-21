import React, { Children, useState } from 'react'

import Card from '@material-ui/core/Card'
import CardContent from '@material-ui/core/CardContent'
import Paper from '@material-ui/core/Paper'

import { useStyles } from '../styles'

function UserList ({ title, idType, users, selections, setSelection }) {
  const styles = useStyles()

  return (
    <>
      <Paper className={styles.header}>{title}</Paper>
      <div>
        {users.map(user => {
          const isSelected = user.id === selections[idType]

          return (
            <Card
              key={user.id}
              style={{ backgroundColor: isSelected ? '#bbdefb' : '#fff' }}
              className={styles.card}
            >
              <CardContent className={styles.cardContent}>
                <div
                  onClick={() => {
                    setSelection(idType, user.id)
                  }}
                >
                  {user.name}
                </div>
              </CardContent>
            </Card>
          )
        })}
      </div>
    </>
  )
}

export default UserList
