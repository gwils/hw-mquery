module HaskellWorks.Data.MQuerySpec (spec) where

import HaskellWorks.Data.Model.Example
import HaskellWorks.Data.MQuery
import HaskellWorks.Hspec.Hedgehog
import Hedgehog
import Test.Hspec

import qualified Data.DList                   as DL
import qualified Data.Foldable                as F
import qualified HaskellWorks.Data.Model.Lens as L

{-# ANN module ("HLint: ignore Redundant do"        :: String) #-}
{-# ANN module ("HLint: ignore Reduce duplication"  :: String) #-}
{-# ANN module ("HLint: ignore Redundant bracket"          :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.Data.MQuerySpec" $ do
  it "Select into lens to a foldable" $ requireProperty $ do
    let q = MQuery $ DL.fromList exampleMounts
    let actual = F.toList $ q >>^.. L.options
    actual === ["nosuid" , "noauto" , "noexec"]
