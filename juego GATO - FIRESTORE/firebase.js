import firebase from 'firebase/app'
import 'firebase/firestore'

firebase.initializeApp({
    apiKey: "AIzaSyCiPyWqkwPDJCBOl2mnOaZt3BSJ2ZNeHZo",
    authDomain: "reactjs-crud-8a1b7.firebaseapp.com",
    databaseURL: "https://reactjs-crud-8a1b7.firebaseio.com",
    projectId: "reactjs-crud-8a1b7",
})
let db=firebase.firestore();
//db.settings({timestampsInSnapshots:true});
export default db;