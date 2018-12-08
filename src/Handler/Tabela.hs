{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Tabela where
import Import
import Network.HTTP.Types.Status
import Text.Lucius
import Text.Julius
import Prelude (read)

getTabelaR :: Handler Html
getTabelaR = do

    defaultLayout $ do 
        
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/tabela.hamlet")
        toWidget $(luciusFile "templates/tabela.lucius")
        

