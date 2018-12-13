{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import

import Text.Lucius
import Text.Julius
import Prelude (read)

getHomeR :: Handler Html
getHomeR = do
    
    camp <- runDB $ selectList [] [Asc CampeonatoData_inicio]

    defaultLayout $ do 
        
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/home.hamlet")
        toWidget $(luciusFile "templates/home.lucius")
        
        
