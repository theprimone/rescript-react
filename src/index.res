@module("./welcome") external welcome: React.element = "welcome"

// Dom access can actually fail. ReScript
// is really explicit about handling edge cases!
switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<div> {welcome} </div>, root)
| None => () // do nothing
}
