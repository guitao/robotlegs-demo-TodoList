package todo.example.ui
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import robotlegs.bender.extensions.viewManager.api.IViewManager;
	
	import spark.components.Application;
	
	import todo.example.ui.api.IPopup;
	import todo.example.view.api.IView;
	
	/**
	 * Wrapper class for the PopUpManager that 
	 * improves the testability of the desig.n 
	 */
	public class Popup implements IPopup
	{
		[Inject]
		public var viewManager: IViewManager;
		
		/**
		 * Presents the view as a popup.
		 */
		public function add(view: IView): void
		{
			viewManager.addContainer(view as DisplayObjectContainer);
			
			try {
				PopUpManager.addPopUp(view as UIComponent, FlexGlobals.topLevelApplication as DisplayObject, true);
				PopUpManager.centerPopUp(view as UIComponent);
			} catch (err: Error) { }
		}
		
		/**
		 * Removes view from being a popup.
		 */
		public function remove(view: IView): void
		{
			PopUpManager.removePopUp(view as UIComponent);
			
			viewManager.removeContainer(view as DisplayObjectContainer);
		}
	}
}