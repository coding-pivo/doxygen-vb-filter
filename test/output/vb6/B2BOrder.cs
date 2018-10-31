/**
 * @file 

 * \brief Single VB6 class module, defining B2BOrder
 */
namespace vb6 {
	class B2BOrder
	: Order
	{
		private string mB2BCustomer;
		private Order mOrderObject;
		public string B2BCustomer
		{ get; set; }
		public string Order_OrderDate
		{ get; }
		public string Order_OrderID
		{ get; set; }
		public  string Order_SaveOrder();
	}
}
