include("mise_en_place.jl")


# Lancer une partie de "98" :
function partie98()
    println("Mise en place du jeu : combien de joueurs ?")
    nb_jr = nombre()
    Jeu_98 = mise_en_place(nb_jr)
    while Jeu_98["compteur"][] < 98
        for i in 1:nb_jr
            println("Joueur ", i, " joue ? Taper O si oui.")
            bon_joueur()
            println("Quelle carte voulez-vous jouer ? Entrer son emplacement (1 à 5).")
            println(Jeu_98[i])
            index = nombre()
            print("\e[2J")
            if index < 1 || index > 5
                println("Pas de carte correspondante. Sélectionner un autre nombre.")
                index = nombre()
            else
                jouer(Jeu_98["compteur"], Jeu_98[i], index, Jeu_98["defausse"], Jeu_98["pioche"])
            end
            if Jeu_98["compteur"][] >= 98 break end
            
            ## Pas sûr que cette partie marche
            if Jeu_98["pioche"] == ""
                Jeu_98["pioche"] = shuffle!(Jeu_98["defausse"])
                Jeu_98["defausse"] = Paquet(Carte[])   
            end
            ##
            
        end
    end
    println("Fin du jeu.")
end