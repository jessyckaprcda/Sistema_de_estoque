-- CreateTable
CREATE TABLE "Movimentacoes" (
    "id_movimentacao" SERIAL NOT NULL,
    "tipo_movimentacao" VARCHAR(10) NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "data_movimentacao" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_funcionario" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,

    CONSTRAINT "Movimentacoes_pkey" PRIMARY KEY ("id_movimentacao")
);

-- AddForeignKey
ALTER TABLE "Movimentacoes" ADD CONSTRAINT "Movimentacoes_id_funcionario_fkey" FOREIGN KEY ("id_funcionario") REFERENCES "Funcionario"("id_funcionario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimentacoes" ADD CONSTRAINT "Movimentacoes_id_produto_fkey" FOREIGN KEY ("id_produto") REFERENCES "Produto"("id_produto") ON DELETE CASCADE ON UPDATE CASCADE;
