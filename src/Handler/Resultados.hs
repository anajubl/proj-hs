{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Resultados where
import Import
import Network.HTTP.Types.Status
import Text.Lucius
import Text.Julius
import Prelude (read)

getResultadosR :: Handler Html
getResultadosR = do

    defaultLayout $ do 
        
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/resultados.hamlet")
        toWidget $(luciusFile "templates/resultados.lucius")

