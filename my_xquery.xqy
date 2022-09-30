  xquery version "1.0-ml";

  import module namespace dls = "http://marklogic.com/xdmp/dls"
      at "/MarkLogic/dls.xqy";
import module namespace search = "http://marklogic.com/appservices/search" at "/MarkLogic/appservices/search/search.xqy";


declare function local:output($x ) {
  fn:string-join($x, " *** ")
};

for $doc in fn:doc()[1 to 5]
  let $meta := $doc//*:akomaNtoso/*:judgment/*:meta
  let $id := $meta/*:identification
  return (
    fn:string-join(
      (local:output($id/*:FRBRWork/*:FRBRthis/@value),
       local:output($id/*:FRBRWork/*:FRBRdate/@date),
       local:output($id//*:FRBRWork/*:FRBRname/@value),
       local:output($id//*:FRBRManifestation/*:FRBRdate[@name="transform"]/@date),
       local:output($meta/*:proprietary/*:cite/text()),
       local:output($meta/*:proprietary/*:court/text())
      ), ";")
  )
