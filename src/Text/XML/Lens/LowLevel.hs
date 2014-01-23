-----------------------------------------------------------------------------
-- |
-- Module      :  Text.XML.Lens
-- Copyright   :  (C) 2013 Fumiaki Kinoshita
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  Fumiaki Kinoshita <fumiexcel@gmail.com>
-- Stability   :  experimental
-- Portability :  non-portable
--
-- Lenses and Prisms Template Haskell could handle
----------------------------------------------------------------------------
module Text.XML.Lens.LowLevel where

import           Control.Lens
import           Data.Map (Map)
import           Data.Text (Text)
import           Text.XML
  ( Document, Doctype, Prologue, ExternalID
  , Node(..), Element, Instruction, Name, Miscellaneous(..)
  )
import qualified Text.XML as XML

-- | A Lens into 'XML.documentPrologue'
documentPrologue :: Lens' Document Prologue
documentPrologue f doc = f (XML.documentPrologue doc) <&> \p -> doc { XML.documentPrologue = p }
{-# INLINE documentPrologue #-}

-- | A Lens into 'XML.documentRoot'
documentRoot :: Lens' Document Element
documentRoot f doc = f (XML.documentRoot doc) <&> \p -> doc { XML.documentRoot = p }
{-# INLINE documentRoot #-}

-- | A Lens into 'XML.documentEpilogue'
documentEpilogue :: Lens' Document [Miscellaneous]
documentEpilogue f doc =  f (XML.documentEpilogue doc) <&> \p -> doc { XML.documentEpilogue = p }
{-# INLINE documentEpilogue #-}

-- | A Lens into 'XML.prologueBefore'
prologueBefore :: Lens' Prologue [Miscellaneous]
prologueBefore f doc =  f (XML.prologueBefore doc) <&> \p -> doc { XML.prologueBefore = p }
{-# INLINE prologueBefore #-}

-- | A Lens into 'XML.prologueDoctype'
prologueDoctype :: Lens' Prologue (Maybe Doctype)
prologueDoctype f doc =  f (XML.prologueDoctype doc) <&> \p -> doc { XML.prologueDoctype = p }
{-# INLINE prologueDoctype #-}

-- | A Lens into 'XML.prologueAfter'
prologueAfter :: Lens' Prologue [Miscellaneous]
prologueAfter f doc =  f (XML.prologueAfter doc) <&> \p -> doc { XML.prologueAfter = p }
{-# INLINE prologueAfter #-}

-- | A Lens into 'XML.doctypeName'
doctypeName :: Lens' Doctype Text
doctypeName f doc =  f (XML.doctypeName doc) <&> \p -> doc { XML.doctypeName = p }
{-# INLINE doctypeName #-}

-- | A Lens into 'XML.doctypeID'
doctypeID :: Lens' Doctype (Maybe ExternalID)
doctypeID f doc =  f (XML.doctypeID doc) <&> \p -> doc { XML.doctypeID = p }
{-# INLINE doctypeID #-}

-- | A Lens into 'XML.elementName'
elementName :: Lens' Element Name
elementName f e = f (XML.elementName e) <&> \p -> e { XML.elementName = p }
{-# INLINE elementName #-}

-- | A Lens into 'XML.elementAttributes'
elementAttributes :: Lens' Element (Map Name Text)
elementAttributes f e = f (XML.elementAttributes e) <&> \p -> e { XML.elementAttributes = p }
{-# INLINE elementAttributes #-}

-- | A Lens into 'XML.elementNodes'
elementNodes :: Lens' Element [Node]
elementNodes f e = f (XML.elementNodes e) <&> \p -> e { XML.elementNodes = p }
{-# INLINE elementNodes #-}

-- | A Lens into 'XML.nameLocalName'
nameLocalName :: Lens' Name Text
nameLocalName f n = f (XML.nameLocalName n) <&> \p -> n { XML.nameLocalName = p }
{-# INLINE nameLocalName #-}

-- | A Lens into 'XML.nameNamespace'
nameNamespace :: Lens' Name (Maybe Text)
nameNamespace f n = f (XML.nameNamespace n) <&> \p -> n { XML.nameNamespace = p }
{-# INLINE nameNamespace #-}

-- | A Lens into 'XML.namePrefix'
namePrefix :: Lens' Name (Maybe Text)
namePrefix f n = f (XML.namePrefix n) <&> \p -> n { XML.namePrefix = p }
{-# INLINE namePrefix #-}

-- | A Lens into 'XML.instructionTarget'
instructionTarget :: Lens' Instruction Text
instructionTarget f i = f (XML.instructionTarget i) <&> \p -> i { XML.instructionTarget = p }
{-# INLINE instructionTarget #-}

-- | A Lens into 'XML.instructionData'
instructionData :: Lens' Instruction Text
instructionData f i = f (XML.instructionData i) <&> \p -> i { XML.instructionData = p }
{-# INLINE instructionData #-}

-- | A Prism into 'XML.NodeElement'
_NodeElement :: Prism' Node Element
_NodeElement = prism' NodeElement (\s -> case s of NodeElement e -> Just e; _ -> Nothing)
{-# INLINE _NodeElement #-}

-- | A Prism into 'XML.NodeContent'
_NodeContent :: Prism' Node Text
_NodeContent = prism' NodeContent (\s -> case s of NodeContent e -> Just e; _ -> Nothing)
{-# INLINE _NodeContent #-}

-- | A Prism into 'XML.NodeInstruction'
_NodeInstruction :: Prism' Node Instruction
_NodeInstruction = prism' NodeInstruction (\s -> case s of NodeInstruction e -> Just e; _ -> Nothing)
{-# INLINE _NodeInstruction #-}

-- | A Prism into 'XML.NodeComment'
_NodeComment :: Prism' Node Text
_NodeComment = prism' NodeComment (\s -> case s of NodeComment e -> Just e; _ -> Nothing)
{-# INLINE _NodeComment #-}