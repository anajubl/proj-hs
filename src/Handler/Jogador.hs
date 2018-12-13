{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Jogador where

import Import
import Database.Persist.Postgresql
import Text.Lucius
import Text.Julius


formJogador :: Form Jogador
formJogador =  renderBootstrap $ Jogador
    <$>areq (selectField listaTimes) "Lista de Times: " Nothing
    <*> areq textField "Nome: " Nothing
    <*> areq  textField "Posição: " Nothing
    <*> areq intField "Numero: " Nothing
    <*> areq textField "Universidade: " Nothing

listaTimes = do
       entidades <- runDB $ selectList [] [Asc TimeNome] 
       optionsPairs $ fmap (\ent -> (timeNome $ entityVal ent, entityKey ent)) entidades
       



getJogadorR :: Handler Html
getJogadorR  = do

    (widgetForm, enctype) <- generateFormPost formJogador
    defaultLayout $ do 
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/jogador.hamlet")
      
        
getJogadoresR :: TimeId -> Handler Html
getJogadoresR timeid = do

    time <- runDB $ get404 timeid
    elenco <- runDB $ selectList [JogadorTime ==. timeid] [] 
    
    defaultLayout $ do 
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/elenco.hamlet")
        toWidget $(luciusFile "templates/elenco.lucius")
        

postJogadorR :: Handler Html
postJogadorR = do 
    ((res,_),_) <- runFormPost formJogador
    case res of 
        FormSuccess jogador -> do 
            runDB $ insert jogador 
            redirect JogadorR
        _ -> redirect JogadorR
