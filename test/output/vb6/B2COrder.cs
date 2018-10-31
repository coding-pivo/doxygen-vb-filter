/**
 * @file 

 * \brief Single VB6 class module, defining B2COrder
 */
namespace vb6 {
	class B2COrder
	: Order
	{
		private string mB2CCustomer;
		private Order mOrderObject;
		public string B2CCustomer
		{ get; set; }
		public string Order_OrderDate
		{ get; }
		public string Order_OrderID
		{ get; set; }
		public  string Order_SaveOrder();
	}
}
