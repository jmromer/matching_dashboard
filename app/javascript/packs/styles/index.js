import { makeStyles } from '@material-ui/core/styles'

const useStyles = makeStyles(() => ({
  root: {
    flexGrow: 1,
    margin: '20px auto'
  },
  card: {
    margin: '10px auto',
    textAlign: 'center',
    cursor: 'pointer',
    '&:hover': {
      backgroundColor: '#ED6D51'
    }
  },
  cardContent: {
    backgroundColor: 'none',
    '&:last-child': {
      padding: '10px',
      paddingBottom: '10px'
    }
  },
  header: {
    textAlign: 'center',
    color: '#fff',
    backgroundColor: '#000'
  },
  list: {
    listStyleType: 'none'
  }
}))

export { useStyles }
