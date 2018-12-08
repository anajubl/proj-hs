{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Login where

import Import
import Network.HTTP.Types.Status
import Text.Lucius
import Text.Julius
import Prelude (read)

getLoginR :: Handler Html
getLoginR = do

    defaultLayout $ do 
        
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/home.hamlet")
        toWidget $(luciusFile "templates/home.lucius")
        
        
