const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const empresaRoutes = require('./routes/empresaRoutes');
const funcionarioRoutes = require('./routes/funcionarioRoutes');
const produtoRoutes = require('./routes/produtoRoutes');
const movimentacaoRoutes = require('./routes/movimentacaoRoutes');

const app = express();

// Middleware de sessão
app.use(
  session({
    secret: 'pabd',
    resave: false,
    saveUninitialized: true,
  })
);

// Configurações do servidor
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.set('view engine', 'ejs');
app.set('views', './views');

// Rotas
app.use('/', empresaRoutes);
app.use('/funcionario', funcionarioRoutes);
app.use('/produto', produtoRoutes);
app.use('/movimentacao', movimentacaoRoutes);

// Inicialização
const PORT = 3000;
app.listen(PORT, () => console.log(`Servidor rodando em http://localhost:${PORT}`));
