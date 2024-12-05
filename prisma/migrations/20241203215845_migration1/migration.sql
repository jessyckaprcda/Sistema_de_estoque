-- CreateTable
CREATE TABLE "Empresa" (
    "id_empresa" SERIAL NOT NULL,
    "nome_empresa" VARCHAR(100) NOT NULL,
    "cnpj" VARCHAR(18) NOT NULL,
    "endereco" TEXT NOT NULL,
    "telefone" VARCHAR(15),
    "email" VARCHAR(100),

    CONSTRAINT "Empresa_pkey" PRIMARY KEY ("id_empresa")
);

-- CreateTable
CREATE TABLE "Funcionario" (
    "id_funcionario" SERIAL NOT NULL,
    "nome_funcionario" VARCHAR(100) NOT NULL,
    "cargo" VARCHAR(50),
    "email" VARCHAR(100) NOT NULL,
    "senha" TEXT NOT NULL,
    "id_empresa" INTEGER NOT NULL,

    CONSTRAINT "Funcionario_pkey" PRIMARY KEY ("id_funcionario")
);

-- CreateTable
CREATE TABLE "Produto" (
    "id_produto" SERIAL NOT NULL,
    "nome_produto" VARCHAR(100) NOT NULL,
    "categoria" VARCHAR(50),
    "quantidade" INTEGER NOT NULL DEFAULT 0,
    "preco" DECIMAL(10,2),
    "id_empresa" INTEGER NOT NULL,

    CONSTRAINT "Produto_pkey" PRIMARY KEY ("id_produto")
);

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_cnpj_key" ON "Empresa"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "Empresa_email_key" ON "Empresa"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Funcionario_email_key" ON "Funcionario"("email");

-- AddForeignKey
ALTER TABLE "Funcionario" ADD CONSTRAINT "Funcionario_id_empresa_fkey" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id_empresa") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Produto" ADD CONSTRAINT "Produto_id_empresa_fkey" FOREIGN KEY ("id_empresa") REFERENCES "Empresa"("id_empresa") ON DELETE CASCADE ON UPDATE CASCADE;
