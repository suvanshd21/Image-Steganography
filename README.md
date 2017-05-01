# Image-Steganography
Image steganography using key encryption, edge-detection and pixel substitution
The edges of the Image are extracted and the information to be encoded is embedded in the edges. The sender creates an encoded image with a key and transfers it to the receiver, the receivers decode the message using the provided key.
It adds to existing algorithms by randomizing the message encryption by only storing in edge bits and using those to decrypt the message on the receiver side, thus warding off potential decryption attempts by outsiders.
