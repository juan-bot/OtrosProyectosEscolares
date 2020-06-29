import React from 'react';
import ReactDOM, { unmountComponentAtNode } from 'react-dom';
import './index.css';
import db from './firebase';

function Square(props) {
  return (
    <button className="square" onClick={props.onClick}>
      {props.value}
    </button>
  );
}

class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tablero: Array(9).fill(null),
      turno: true,
  
    };
    //this.ObtenerDoc=this.ObtenerDoc.bind(this);
  }

  ObtenerDoc =()=>{
    var docRef = db.collection("jugadas").doc("Xe3bmHlpFSGjrxdNPTcH");
    let currentComponent = this;
    const squares = currentComponent.state.tablero.slice();
    docRef.get().then(function(doc) {
        if (doc.exists) {
            //console.log("Document data:", doc.data().tablero);
            /*this.setState({
              //tablero: doc.data().tablero,
              lectura: doc.data().enable
            })*/
            //if(currentComponent.state.lectura==true){
              currentComponent.setState({
                tablero: doc.data().tablero,
                turno:doc.data().turno
                //lectura: doc.data().enable
              })
            /*}else{
              this.modificarDoc(squares);
            }*/

        } else {
            // doc.data() will be undefined in this case
            console.log("No such document!");
        }
    }).catch(function(error) {
        console.log("Error getting document:", error);
    });
  }
  
//////////// jalaaaaaa ///////////////////////////
  modificarDoc=(squares)=>{
    let currentComponent = this;
    db.collection("jugadas").doc("Xe3bmHlpFSGjrxdNPTcH").set({
      //tablero: this.state.tablero,
      tablero:squares,
      turno: !currentComponent.state.turno
    })
    .then(function() {
        console.log("Document successfully written!");
    })
    .catch(function(error) {
        console.error("Error writing document: ", error);
    });
  }


  handleClick(i) {
    const squares = this.state.tablero.slice();
    //this.ObtenerDoc();
    if (calculateWinner(squares) || squares[i]) {
      return;
    }
    squares[i] = this.state.turno ? 'X' : 'O';
    this.setState({
      tablero: squares,
      turno: !this.state.turno,
    });
    this.modificarDoc(squares);
  }

  renderSquare(i) {
    return (
      <Square
        value={this.state.tablero[i]}
        onClick={() => this.handleClick(i)}
      />
    );
  }
 
  render() {
    
    const winner = calculateWinner(this.state.tablero);
    let status;
    this.ObtenerDoc();
    if (winner) {
      status = 'GANADOR: ' + winner;
      
    } else {
      status = 'TURNO: ' + (this.state.turno ? 'X' : 'O');
    }
   
    return (
      <div>
        <div className="status">{status}</div>
        <div className="board-row">
          {this.renderSquare(0)}
          {this.renderSquare(1)}
          {this.renderSquare(2)}
        </div>
        <div className="board-row">
          {this.renderSquare(3)}
          {this.renderSquare(4)}
          {this.renderSquare(5)}
        </div>
        <div className="board-row">
          {this.renderSquare(6)}
          {this.renderSquare(7)}
          {this.renderSquare(8)}
        </div>
      </div>
    );
    
  }
}

class Game extends React.Component {
  render() {
    return (
      <div className="game">
        <div className="game-board">
          <Board />
        </div>
        <div className="game-info">
          <div>{/* status */}</div>
          <ol>{/* TODO */}</ol>
        </div>
      </div>
    );
  }
}

// ========================================

ReactDOM.render(
  <Game />,
  document.getElementById('root')
);

function calculateWinner(squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [a, b, c] = lines[i];
    if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
      return squares[a];
    }
  }
  return null;
}
///////////////jalaaa //////////////
  /*componentDidMount(){
    db.collection('jugadas').get().then((snapshot)=>{
      this.setState({
        jugada:snapshot.docs.map(doc=>{
          console.log(doc.data());
        })
      })
    })
  }*/
  /*componentDidMount(){
    var docRef = db.collection("jugadas").doc("Xe3bmHlpFSGjrxdNPTcH");
    let currentComponent = this;
    docRef.get().then(function(doc) {
        if (doc.exists) {
            console.log("Document data:", doc.data().tablero);
            //aux:doc.data().tablero,
            currentComponent.setState({tablero: doc.data().tablero})
        } else {
            // doc.data() will be undefined in this case
            console.log("No such document!");
        }
    }).catch(function(error) {
        console.log("Error getting document:", error);
    });
  }*/
