const express = require('express');
const session = require('express-session');
const empresaController = require('../controllers/empresaController');

const router = express.Router();

router.get('/', empresaController.homePage);
router.get('/cadastro', empresaController.cadastroPage);
router.post('/cadastro', empresaController.cadastrarEmpresa);
// Rota genérica de login
router.get('/login', (req, res) => res.render('login'));

router.get('/login/empresa', empresaController.loginPage);
router.post('/login/empresa', empresaController.login);
router.get('/index/:id_empresa', empresaController.empresaIndex);

module.exports = router;
