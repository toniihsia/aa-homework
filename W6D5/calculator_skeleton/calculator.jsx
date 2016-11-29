import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: '', num2: '', result: 0 };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);

    this.addition = this.addition.bind(this);
    this.subtraction = this.subtraction.bind(this);
    this.multiplication = this.multiplication.bind(this);
    this.division = this.division.bind(this);

  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : '';
    this.setState({num1});
  }

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : '';
    this.setState({num2});
  }

  addition(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtraction(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result});
  }

  multiplication(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result});
  }

  division(e) {
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result});
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: '', num2: '', result: '0' });
  }

  render(){
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>
        <button onClick={this.clear}>Clear</button>
        <br></br>
        <button onClick={this.addition}>+</button>
        <button onClick={this.subtraction}>-</button>
        <button onClick={this.multiplication}>*</button>
        <button onClick={this.division}>/</button>
      </div>
    );
  }
}

export default Calculator;
