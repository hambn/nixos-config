{ pkgs, ... }: {
  # XMLStarlet - Command-line XML toolkit
  # Query, edit, validate, and transform XML documents
  # Swiss army knife for XML processing
  # Usage: xmlstarlet sel -t -v "//node" file.xml
  environment.systemPackages = [ pkgs.xmlstarlet ];
}
