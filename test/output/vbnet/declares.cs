/**
 * @file declares.vb
 *  <summary>example file demonstrating Windows API Declares</summary>
 *  <remarks>The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/DotNET/declares.vb">declares.vb</A></remarks>
 */
using System.IO;
using System.Threading;
using System.Runtime.Serialization;
namespace vbnet {
	/**
	 *  <summary>
	 *  simple class with Windows API functions
	 *  </summary>
	 *  <remarks>implements some windows api functions</remarks>
	 */
	public class WinAPIClass
	{
		/**
		 *  <summary>
		 *  Places (posts) a message in the message queue associated with the thread.
		 *  </summary>
		 *  <param name="hWnd">A handle to the window whose window procedure is to receive the message.</param>
		 *  <param name="uMsg">The message to be posted.</param>
		 *  <param name="wParam">Additional message-specific information.</param>
		 *  <param name="lParam">Additional message-specific information.</param>
		 *  <returns>If the function succeeds, the return value is nonzero.</returns>
		 */
		/** \remark Is imported from external library: user32.dll (Alias: PostMessageA) */
		private extern  bool PostMessage(int hWnd, int uMsg, int wParam, int lParam);
		/**
		 *  <summary>
		 *  Brings the thread that created the specified window into the foreground and activates the window
		 *  </summary>
		 *  <param name="handle">A handle to the window that should be activated and brought to the foreground.</param>
		 *  <returns>If the window was brought to the foreground, the return value is nonzero.</returns>
		 */
		/** \remark Is imported from external library: user32.dll */
		private extern  bool SetForegroundWindow(IntPtr handle);
		/**
		 *  <summary>
		 *  Sets the specified window's show state.
		 *  </summary>
		 *  <param name="hWnd">A handle to the window.</param>
		 *  <param name="nCmdShow">Controls how the window is to be shown</param>
		 *  <returns>If the window was previously visible, the return value is nonzero</returns>
		 */
		/** \remark Is imported from external library: user32.dll */
		private extern  bool ShowWindow(IntPtr hWnd, SHOW_WINDOW nCmdShow);
		/**
		 *  <summary>
		 *  Retrieves the show state and the restored, minimized, and maximized positions of the specified window.
		 *  </summary>
		 *  <param name="hwnd">A handle to the window. </param>
		 *  <param name="lpwndpl">A pointer to the WINDOWPLACEMENT structure that receives the show state and position information.</param>
		 *  <returns>If the function succeeds, the return value is nonzero.</returns>
		 *  <remarks></remarks>
		 */
		/** \remark Is imported from external library: user32 */
		private extern  int GetWindowPlacement(IntPtr hwnd, ref WINDOWPLACEMENT lpwndpl);
		/**
		 *  <summary>
		 *  Contains information about the placement of a window on the screen.
		 *  </summary>
		 */
		private struct WINDOWPLACEMENT
		{
			public int Length;
			public int flags;
			/**
			 *  <summary>
			 *  The current show state of the window
			 *  </summary>
			 */
			public int showCmd;
			public POINTAPI ptMinPosition;
			public POINTAPI ptMaxPosition;
			public RECT rcNormalPosition;
		}
		/**
		 *  <summary>
		 *  The POINT structure defines the x- and y- coordinates of a point
		 *  </summary>
		 */
		private struct POINTAPI
		{
			public int x;
			public int y;
		}
		/**
		 *  <summary>
		 *  The RECT structure defines the coordinates of the upper-left and lower-right corners of a rectangle.
		 *  </summary>
		 */
		private struct RECT
		{
			public int Left;
			public int Top;
			public int Right;
			public int Bottom;
		}
		/**
		 *  <summary>
		 *  default windows message code for communication between applications
		 *  </summary>
		 *  <remarks>WM_USER is outdated and should not be used</remarks>
		 */
		private const WM_APP = &H8000;
		/**
		 *  <summary>
		 *  system command windows message
		 *  </summary>
		 *  <remarks>is used to send system events to a window</remarks>
		 */
		private const WM_SYSCOMMAND = &H112;
		/**
		 *  <summary>
		 *  cloase parameter for system command windows message
		 *  </summary>
		 *  <remarks>is used to send a close event to a window</remarks>
		 */
		private const SC_CLOSE = &HF060&;
		/**
		 *  <summary>
		 *  Enumeration of window status codes
		 *  </summary>
		 */
		private enum SHOW_WINDOW
		{
			SW_HIDE = 0,
			SW_SHOWNORMAL = 1,
			SW_NORMAL = 1,
			SW_SHOWMINIMIZED = 2,
			SW_SHOWMAXIMIZED = 3,
			SW_MAXIMIZE = 3,
			SW_SHOWNOACTIVATE = 4,
			SW_SHOW = 5,
			SW_MINIMIZE = 6,
			SW_SHOWMINNOACTIVE = 7,
			SW_SHOWNA = 8,
			SW_RESTORE = 9,
			SW_SHOWDEFAULT = 10,
			SW_FORCEMINIMIZE = 11,
			SW_MAX = 11
		}
		/**
		 *  <summary>
		 *  Retrieves the length, in characters, of the specified window's title bar text
		 *  </summary>
		 *  <param name="hwnd">A handle to the window or control.</param>
		 *  <returns>If the function succeeds, the return value is the length, in characters, of the text.</returns>
		 */
		/** \remark Is imported from external library: user32.dll (Alias: GetWindowTextLengthA) */
		private extern  int GetWindowTextLength(int hwnd);
		/**
		 *  <summary>
		 *  Copies the text of the specified window's title bar (if it has one) into a buffer
		 *  </summary>
		 *  <param name="hwnd">A handle to the window or control containing the text.</param>
		 *  <param name="lpString">The buffer that will receive the text.</param>
		 *  <param name="cch">The maximum number of characters to copy to the buffer, including the null character.</param>
		 *  <returns>If the function succeeds, the return value is the length, in characters, of the copied string, not including the terminating null character.</returns>
		 */
		/** \remark Is imported from external library: user32 (Alias: GetWindowTextA) */
		private extern  int GetWindowText(int hwnd, string lpString, int cch);
		/**
		 *  <summary>
		 *  Retrieves the identifier of the thread that created the specified window
		 *  </summary>
		 *  <param name="hwnd">A handle to the window.</param>
		 *  <param name="lpdwProcessId">A pointer to a variable that receives the process identifier.</param>
		 *  <returns>The return value is the identifier of the thread that created the window. </returns>
		 */
		/** \remark Is imported from external library: user32 */
		public extern Auto  int GetWindowThreadProcessId(int hwnd, ref int lpdwProcessId);
		/**
		 *  <summary>
		 *  Enumerates all top-level windows on the screen by passing the handle to each window, in turn, to an application-defined callback function.
		 *  </summary>
		 *  <param name="lpEnumFunc">A pointer to an application-defined callback function.</param>
		 *  <param name="lParam">An application-defined value to be passed to the callback function.</param>
		 *  <returns>If the function succeeds, the return value is nonzero.</returns>
		 */
		/** \remark Is imported from external library: user32 */
		private extern  int EnumWindows(EnumWindowsCallBack lpEnumFunc, int lParam);
	}
}
