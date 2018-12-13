{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Noticia where

import Import

import Text.Lucius
import Text.Julius
import Prelude (read)

getNoticiaR :: Handler Html
getNoticiaR = do
    
    noticias <- runDB $ selectList [] [Asc NoticiaId]

    defaultLayout $ do 
        
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/noticia.hamlet")
        toWidget $(luciusFile "templates/noticia.lucius")
        
        
