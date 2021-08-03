//
//  AddDesejoViewModel.swift
//  Wollen
//
//  Created by Mayara Mendonça de Souza on 19/07/21.
//

import Foundation
import CoreData
import UIKit

class AddDesejoViewModel: ObservableObject {
    
    // Atributos do Desejo
    @Published var nome: String = ""
    @Published var descricao: String = ""
    @Published var link: String = ""
    @Published var preco: String = ""
    
    // Atributos da Categoria
    @Published var nomeCategoria: String = ""
    @Published var cor: String = ""
    
    // Atributos da Meta
    @Published var duracao: Int = 0
    @Published var duracao2: String = ""
    @Published var frequencia: String = ""
    @Published var valorAtual: String = ""
    @Published var valorMeta: String = ""
    @Published var tipo: String = "Por valor"
    
    // Atributos da Mídia
    @Published var imagensMidia = [UIImage]()
    var imagemPadrao = #imageLiteral(resourceName: "card")
    
    // Cria um desejo com categoria e meta associadas
    func addDesejo() {
        let manager = CoreDataManager.shared
        let context = manager.persistentContainer.viewContext
        
        let desejo = Desejo(context: context)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = Double(preco) ?? 0.0
        
        // Cria uma nova categoria para ser associada ao desejo
        let categoria = Categoria(context: context)
        categoria.nome = nomeCategoria
        categoria.cor = cor
        desejo.categoria = categoria
        
        // Cria uma nova meta para ser associada ao desejo
        let meta = Meta(context: context)
        meta.duracao = Int16(duracao) ?? 0
        meta.duracao2 = duracao2
        meta.frequencia = frequencia
        meta.valorAtual = Double(valorAtual) ?? 0.0
        meta.valorMeta = Double(valorMeta) ?? 0.0
        meta.tipo = tipo
        desejo.meta =  meta
        
        // Verifica se o array de imagem está vazio, e se estiver, adiciona uma imagem padrão
        if (imagensMidia.isEmpty) {
            let midia = Midia(context: context)
            let dadosImagem = imagemPadrao.pngData()
            midia.imagem = dadosImagem
            desejo.addToImagens(midia)
        } else {
            // Cria uma nova mídia para ser associada ao desejo para cada imagem selecionada e associa ao desejo
            for imagemMidia in imagensMidia {
                let midia = Midia(context: context)
                let dadosImagem = imagemMidia.pngData()
                midia.imagem = dadosImagem
                desejo.addToImagens(midia)
                
            }
        }
        
        manager.save()
        
    }
    
    // Cria um desejo associado a uma categoria já existente
    func addDesejoToCategoria(categoriaId: NSManagedObjectID) {
        
        let manager = CoreDataManager.shared
        
        let categoria: Categoria? = manager.getCategoriaById(id: categoriaId)
        
        if let categoria = categoria {
            let desejo = Desejo(context: manager.persistentContainer.viewContext)
            desejo.nome = nome
            desejo.descricao = descricao
            desejo.link = link
            desejo.preco = Double(preco) ?? 0.0
            desejo.categoria = categoria

            
            let meta = Meta(context: manager.persistentContainer.viewContext)
            meta.duracao = Int16(duracao) ?? 0
            meta.duracao2 = duracao2
            meta.frequencia = frequencia
            meta.valorAtual = Double(valorAtual) ?? 0.0
            meta.valorMeta = Double(valorMeta) ?? 0.0
            meta.tipo = tipo
            desejo.meta = meta
            
            // Cria uma nova mídia para ser associada ao desejo para cada imagem selecionada e associa ao desejo
            for imagemMidia in imagensMidia {
                let midia = Midia(context: manager.persistentContainer.viewContext)
                let dadosImagem = imagemMidia.pngData()
                midia.imagem = dadosImagem
                desejo.addToImagens(midia)
                
            }
            
            manager.save()
            print("Salvou o desejo!")
            
        }

    }
    
    // Cria um desejo que não está associado a nenhuma categoria
    func saveDesejo() {
        
        let manager = CoreDataManager.shared
        let desejo = Desejo(context: manager.persistentContainer.viewContext)
        desejo.nome = nome
        desejo.descricao = descricao
        desejo.link = link
        desejo.preco = Double(preco) ?? 0.0
        
        manager.save()
        print("Botao save desejo")
    }
    
}
