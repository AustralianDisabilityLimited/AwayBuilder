package awaybuilder.web.controller
{
	import awaybuilder.web.controller.events.OpenFromInvokeEvent;
	import awaybuilder.model.DocumentModel;
	
	import mx.events.CloseEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class OpenFromInvokeCommand extends Command
	{
		[Inject]
		public var document:DocumentModel;
		
		[Inject]
		public var event:OpenFromInvokeEvent;
		
		override public function execute():void
		{
//			if( document.empty ) 
//			{
//				this.dispatch(new ReadDocumentEvent(ReadDocumentEvent.REPLACE_DOCUMENT, event.file.name, event.file.url));
//				return;
//			}
//				
//			var popup:ImportWarningPopup = ImportWarningPopup.show( popup_closeHandler );
		}
		
		private function popup_closeHandler( e:CloseEvent ):void 
		{
//			switch( e.detail )
//			{
//				case Alert.YES:
//					this.dispatch(new ReadDocumentEvent(ReadDocumentEvent.APPEND_DOCUMENT, event.file.name, event.file.url));
//					break;
//				case Alert.NO:
//					this.dispatch(new ReadDocumentEvent(ReadDocumentEvent.REPLACE_DOCUMENT, event.file.name, event.file.url));
//					break;
//				default:
//					break;
//			}
		}
	}
}