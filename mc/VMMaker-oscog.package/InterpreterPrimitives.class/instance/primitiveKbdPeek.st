I/O primitives deprecated
primitiveKbdPeek
	"Obsolete on virtually all platforms; old style input polling code.
	Return the next keycode and without removing it from the input buffer. The low byte is the 8-bit ISO character. The next four bits are the Smalltalk modifier bits <cmd><option><ctrl><shift>."

	self primitiveFailFor: PrimErrUnsupported.