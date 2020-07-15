import firebase from 'firebase';
import 'firebase/firestore';

const config = {
  apiKey: "AIzaSyCiPyWqkwPDJCBOl2mnOaZt3BSJ2ZNeHZo",
  authDomain: "reactjs-crud-8a1b7.firebaseapp.com",
  databaseURL: "https://reactjs-crud-8a1b7.firebaseio.com",
  projectId: "reactjs-crud-8a1b7",
  storageBucket: "reactjs-crud-8a1b7.appspot.com",
  messagingSenderId: "478111560708",
};
firebase.initializeApp(config);


export default firebase;