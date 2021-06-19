#!/bin/bash 

converte_imagem(){
	local caminho_imagem=$1
	local iamgem_sem_extensao=$(ls $caminho_imagem | awl -F. '{ print $1 }')
	convert $iamgem_sem_extensao.jpg $iamgem_sem_extensao.png
}

varrer_diretorio(){
	cd $1
	for arquivo in * 
	do 
		local caminho_arquivo=$(find ~/imagens-novos-livros -name $arquivo)
		if [ -d caminho_arquivo ]
		then 
			varrer_diretorio $caminho_arquvio
		else 
			converte_imagem $caminho_arquivo
		fi 
	done
}

varrer_diretorio ~/imagens-novos-livros 

if [ $? -eq 0 ]
then
	echo 'Conversão feita com sucesso'
else
	echo 'Erro no processo'
fi 
