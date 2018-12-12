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

getTabelaR :: CampeonatoId -> Handler Html
getTabelaR campeonatoid =  do
    
    campeonato <- runDB $ get404 campeonatoid
    timecamp <- runDB $ selectList [Time_campeonatoCampeonatoid ==. campeonatoid] [] 
    timeid <- return $ fmap (\m -> time_campeonatoTimeid $ entityVal m) timecamp
    times <- runDB $ selectList [TimeId <-. timeid] []
        
    defaultLayout $ do 
        addStylesheet $ StaticR css_bootstrap_css
        $(whamletFile "templates/tabela.hamlet")
        toWidget $(luciusFile "templates/tabela.lucius")
        

