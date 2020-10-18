#############################################################################
##
#F  EnhanceRootDirectories( <paths> )
##
DeclareGlobalFunction( "EnhanceRootDirectories" );
InstallGlobalFunction( EnhanceRootDirectories, function( rootpaths )
    rootpaths:= Filtered( rootpaths, path -> not path in GAPInfo.RootPaths );
    if not IsEmpty( rootpaths ) then
      # Append the new root paths.
      GAPInfo.RootPaths:= Immutable( Concatenation( rootpaths,
          GAPInfo.RootPaths ) );
      # Clear the cache.
      GAPInfo.DirectoriesLibrary:= AtomicRecord( rec() );
      # Reread the package information.
      if IsBound( GAPInfo.PackagesInfoInitialized ) and
         GAPInfo.PackagesInfoInitialized = true then
        GAPInfo.PackagesInfoInitialized:= false;
        InitializePackagesInfoRecords();
      fi;
    fi;
end );
