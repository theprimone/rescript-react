@react.component
let make = (~title: string) => {
  let (count, setCount) = React.Uncurried.useState(_ => 0)
  let (text, setText) = React.useState(_ => "")

  let onClick = evt => {
    ReactEvent.Mouse.preventDefault(evt)
    setCount(.prev => prev + 1)
  }

  let onChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setText(_prev => value)
  }

  let times = switch count {
  | 1 => "once"
  | 2 => "twice"
  | n => Belt.Int.toString(n) ++ " times"
  }
  let msg = "Click me " ++ times

  <div>
    <h2> {title->React.string} </h2>
    <div> <textarea onChange value=text /> </div>
    <div style={ReactDOM.Style.make(~fontWeight="bold", ())}> {`echo: ${text}`->React.string} </div>
    <div style={ReactDOM.Style.make(~marginTop="8px", ())}>
      <button onClick> {msg->React.string} </button>
    </div>
  </div>
}
