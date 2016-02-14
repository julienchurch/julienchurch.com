{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module Web.Views.Site where

import Model.CoreTypes
import System.FilePath

import Control.Monad
import Text.Blaze.XHtml5 ((!))
import qualified Data.Text as T
import qualified Text.Blaze.Bootstrap as H
import qualified Text.Blaze.XHtml5 as H
import qualified Text.Blaze.XHtml5.Attributes as A
import Text.Blaze.Html
import Text.Blaze.Html.Renderer.String (renderHtml)
import Text.Hamlet (shamlet, hamlet, hamletFile, shamletFile)
import Data.Char (toLower)
import Data.List (sort)

data SiteView
   = SiteView
   { sv_blogName :: T.Text
   , sv_blogDesc :: T.Text
   , sv_user :: Maybe User
   }

siteTemplate :: FilePath
siteTemplate = "template.hamlet"

siteView :: SiteView -> Html -> Html
siteView sv body = $(shamletFile "src/Web/Views/template.hamlet")

    {- H.html $ -}
    {- do H.head $ -}
        {- do H.title (H.toHtml $ sv_blogName sv) -}
           {- H.meta ! A.charset "utf-8" -}
           {- H.meta ! A.name "viewport" ! A.content "width=device-width, initial-scale=1" -}
           {- H.link ! A.href "http://localhost:3030/css/main.css" ! A.rel "stylesheet" -}
       {- H.body $ -}
        {- do H.div ! A.class_ "blog-masthead" $ -}
            {- H.div ! A.class_ "container" $ -}
             {- H.nav ! A.class_ "blog-nav" $ -}
              {- do H.a ! A.class_ "blog-nav-item" ! A.href "/" $ "Home" -}
                 {- H.a ! A.class_ "blog-nav-item" ! A.href "/about" $ "About" -}
                 {- case sv_user sv of -}
                   {- Nothing -> -}
                       {- do H.a ! A.class_ "blog-nav-item" ! A.href "/login" $ "Login" -}
                   {- Just user -> -}
                       {- do when (userIsAdmin user || userIsAuthor user) $ -}
                               {- H.a ! A.class_ "blog-nav-item" ! A.href "/write" $ "Write" -}
                          {- when (userIsAdmin user) $ -}
                               {- H.a ! A.class_ "blog-nav-item" ! A.href "/manage" $ "Manage" -}
                          {- H.a ! A.class_ "blog-nav-item" ! A.href "/logout" $ "Logout" -}
           {- H.div ! A.class_ "container" $ body -}

panelWithErrorView :: T.Text -> Maybe T.Text -> H.Html -> H.Html
panelWithErrorView title mError ct = 
    $(shamletFile "src/Web/Views/panelWithErrorView.hamlet")
    {- H.div ! A.class_ "panel panel-info" ! A.style "margin-top: 30px;" $ -}
     {- do H.div ! A.class_ "panel-heading" $ -}
         {- H.div ! A.class_ "panel-title" $ H.toHtml title -}
        {- H.div ! A.class_ "panel-body" $ -}
         {- do case mError of -}
              {- Just errMsg -> -}
                  {- H.alertBox H.BootAlertDanger (H.toHtml errMsg) -}
              {- Nothing -> mempty -}
            {- H.div ct -}
