/*The following coed describe 1 to 2 decoder in both behavioura manner and data flow fashion.
in former case the implementation is by on multiplexer implementd by case constructs and
followed by a multiplexer that controlled by enable signal. in case of en = 0 the output
will be zero.
The latter is exactly the decoder implementation with and gate that we always study in
courses like memories decoders. Notice that 2 And gate is required for decoder itself and 
enable and select each one will require 1 And gate. 
it is very easy to turn the logic into active low one.

The more interesting way to implemet decoders are by means of shif operator. it is more efficient in
implementation. 

*/