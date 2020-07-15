import React, { Component } from 'react';
import { StyleSheet, ScrollView, Button, View,Text,Image } from 'react-native';



class Principal extends Component {
entrar = () =>{
    const { navigation } = this.props;
    this.props.navigation.navigate('Board');
}
  render() {
      return (
        <View >
            <Text  style={estilos.texto}>Bienvenido</Text>
            <Image
              style={estilos.img}
              source={require('./logo.jpg')}
            />
        <View style={estilos.btn} >
            <Button
              large
              backgroundColor={'#CCCCCC'}
              leftIcon={{name: 'Siguiente'}}
              title='Siguiente'
              onPress={() => {
                this.entrar();
              }} />
          </View>
      </View>
            
      );        
  }
}
const estilos = StyleSheet.create({
    texto:{
        fontSize: 30,
        marginLeft:110
    },
    btn: {
      marginTop: 100
    },
    img: {
      width: 220,
      height: 220,
      marginTop: 150,
      margin:72
    }
  })
export default Principal;
