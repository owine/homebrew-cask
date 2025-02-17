cask "araxis-merge" do
  version "2022.5786"
  sha256 "a8a65089d7965a3ecdf3b65dbeaed54f4f31d0bc7b85c9d970aa999ab5cfa4df"

  on_el_capitan :or_older do
    version "2018.5008"
    sha256 "db47fa9e0d90313a3eb0239248e2cb23489d3ca695ebe9a1299e188efd4a4bb2"

    livecheck do
      skip "Legacy version for El Capitan and earlier"
    end
  end
  on_sierra do
    version "2019.5137"
    sha256 "e3be039c7e6c8a42c172b8d18cfdad0d98fe05b1a74d1e6801d323752c0438b2"

    livecheck do
      skip "Legacy version for Sierra"
    end
  end
  on_high_sierra do
    version "2020.5350"
    sha256 "916cbada651214ce55282ccb93923e22ab17a1ee1227217f5dd949b8f7de7fcb"

    livecheck do
      skip "Legacy version for High Sierra"
    end
  end
  on_mojave do
    version "2021.5602"
    sha256 "06c56e6d08057090f3718b6db560e2a79551f953d4c83c0fad8b60f415c59347"

    livecheck do
      skip "Legacy version for Mojave"
    end
  end

  url "https://www.araxis.com/download/Merge#{version}-macOS.dmg"
  name "Araxis Merge"
  desc "Two and three-way file comparison, merging and folder synchronization"
  homepage "https://www.araxis.com/merge/"

  livecheck do
    url "https://www.araxis.com/merge/download.en"
    regex(/href=.*?Merge[._-]?v?(\d+(?:\.\d+)+)-macOS\.dmg/i)
  end

  depends_on macos: ">= :el_capitan"

  app "Araxis Merge.app"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisgitdiff"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisopendiff"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvndiff"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/compare", target: "araxiscompare"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisgitmerge"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisp4diff"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvndiff3"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/compare2", target: "araxiscompare2"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxishgmerge"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxisp4winmrg"
  binary "#{appdir}/Araxis Merge.app/Contents/Utilities/araxissvnmerge"

  zap trash: [
    "~/Library/Preferences/com.araxis.merge.LSSharedFileList.plist",
    "~/Library/Preferences/com.araxis.merge.plist",
  ]

  caveats <<~EOS
    For instructions to integrate Araxis Merge with Finder or other applications,
    see https://www.araxis.com/merge/documentation-os-x/installing.en
  EOS
end
