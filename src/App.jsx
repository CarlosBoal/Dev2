import { useState } from 'react';
import './App.css';

function App() {
  const [count, setCount] = useState(0);

  const url =
    'https://www.eletropecas.com/_uploads/ProdutoDestaque/ProdutoDestaque_8365_orig.jpg';

  return (
    <>
      <h1>Olá Mundo!</h1>
      <h3>Contador de clicks</h3>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <div>
          <h3>New feature</h3>
        </div>
      </div>
    </>
  );
}
export default App;
