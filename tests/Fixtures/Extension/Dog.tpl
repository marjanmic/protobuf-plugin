<?php
/**
 * Generated by Protobuf protoc plugin.
 *
 * File descriptor : extension.proto
 */


namespace ProtobufCompilerTest\Protos\Extension;

/**
 * Protobuf message : ProtobufCompilerTest.Protos.Extension.Dog
 *
 * @\Protobuf\Annotation\Descriptor(
 *   name="Dog",
 *   package="ProtobufCompilerTest.Protos.Extension",
 *   fields={
 *     @\Protobuf\Annotation\Field(
 *       name="bones_buried",
 *       tag=1,
 *       type=5,
 *       label=1,
 *       reference="ProtobufCompilerTest.Protos.Extension.Dog"
 *     )
 *   },
 *   extensions={
 *     @\Protobuf\Annotation\Field(
 *       name="animal",
 *       tag=101,
 *       type=11,
 *       label=1,
 *       reference="ProtobufCompilerTest.Protos.Extension.Dog",
 *       extendee="ProtobufCompilerTest.Protos.Extension.Animal"
 *     )
 *   }
 * )
 */
class Dog extends \Protobuf\AbstractMessage implements \Protobuf\Extension
{

    /**
     * @var \Protobuf\UnknownFieldSet
     */
    protected $unknownFieldSet = null;

    /**
     * @var \Protobuf\Extension\ExtensionFieldMap
     */
    protected $extensions = null;

    /**
     * bones_buried optional int32 = 1
     *
     * @var int
     */
    protected $bones_buried = null;

    /**
     * Extension field : animal optional message = 101
     *
     * @var \Protobuf\Extension
     */
    protected static $animal = null;

    /**
     * Check if 'bones_buried' has a value
     *
     * @return bool
     */
    public function hasBonesBuried()
    {
        return $this->bones_buried !== null;
    }

    /**
     * Get 'bones_buried' value
     *
     * @return int
     */
    public function getBonesBuried()
    {
        return $this->bones_buried;
    }

    /**
     * Set 'bones_buried' value
     *
     * @param int $value
     */
    public function setBonesBuried($value = null)
    {
        $this->bones_buried = $value;
    }

    /**
     * {@inheritdoc}
     */
    public function extensions()
    {
        if ( $this->extensions !== null) {
            return $this->extensions;
        }

        return $this->extensions = new \Protobuf\Extension\ExtensionFieldMap(__CLASS__);
    }

    /**
     * {@inheritdoc}
     */
    public function unknownFieldSet()
    {
        return $this->unknownFieldSet;
    }

    /**
     * Extension field : animal
     *
     * @return \Protobuf\Extension
     */
    public static function animal()
    {
        if (self::$animal !== null) {
            return self::$animal;
        }

        $readCallback = function (\Protobuf\ReadContext $context, $wire) {
            $reader = $context->getReader();
            $length = $context->getLength();
            $stream = $context->getStream();

            \Protobuf\WireFormat::assertWireType($wire, 11);

            $innerSize    = $reader->readVarint($stream);
            $innerMessage = new \ProtobufCompilerTest\Protos\Extension\Dog();

            $value = $innerMessage;

            $context->setLength($innerSize);
            $innerMessage->readFrom($context);
            $context->setLength($length);

            return $value;
        };

        $writeCallback = function (\Protobuf\WriteContext $context, $value) {
            $stream      = $context->getStream();
            $writer      = $context->getWriter();
            $sizeContext = $context->getComputeSizeContext();

            $writer->writeVarint($stream, 810);
            $writer->writeVarint($stream, $value->serializedSize($sizeContext));
            $value->writeTo($context);
        };

        $sizeCallback = function (\Protobuf\ComputeSizeContext $context, $value) {
            $calculator = $context->getSizeCalculator();
            $size       = 0;

            $innerSize = $value->serializedSize($context);

            $size += 2;
            $size += $innerSize;
            $size += $calculator->computeVarintSize($innerSize);

            return $size;
        };

        return self::$animal = new \Protobuf\Extension\ExtensionField('\\ProtobufCompilerTest\\Protos\\Extension\\Animal', 'animal', 101, $readCallback, $writeCallback, $sizeCallback);
    }

    /**
     * {@inheritdoc}
     */
    public static function fromStream($stream, \Protobuf\Configuration $configuration = null)
    {
        return new self($stream, $configuration);
    }

    /**
     * {@inheritdoc}
     */
    public function toStream(\Protobuf\Configuration $configuration = null)
    {
        $config  = $configuration ?: \Protobuf\Configuration::getInstance();
        $context = $config->createWriteContext();
        $stream  = $context->getStream();

        $this->writeTo($context);
        $stream->seek(0);

        return $stream;
    }

    /**
     * {@inheritdoc}
     */
    public function writeTo(\Protobuf\WriteContext $context)
    {
        $stream      = $context->getStream();
        $writer      = $context->getWriter();
        $sizeContext = $context->getComputeSizeContext();

        if ($this->bones_buried !== null) {
            $writer->writeVarint($stream, 8);
            $writer->writeVarint($stream, $this->bones_buried);
        }

        if ($this->extensions !== null) {
            $this->extensions->writeTo($context);
        }

        return $stream;
    }

    /**
     * {@inheritdoc}
     */
    public function readFrom(\Protobuf\ReadContext $context)
    {
        $reader = $context->getReader();
        $length = $context->getLength();
        $stream = $context->getStream();

        $limit = ($length !== null)
            ? ($stream->tell() + $length)
            : null;

        while ($limit === null || $stream->tell() < $limit) {

            if ($stream->eof()) {
                break;
            }

            $key  = $reader->readVarint($stream);
            $wire = \Protobuf\WireFormat::getTagWireType($key);
            $tag  = \Protobuf\WireFormat::getTagFieldNumber($key);

            if ($stream->eof()) {
                break;
            }

            if ($tag === 1) {
                \Protobuf\WireFormat::assertWireType($wire, 5);

                $this->bones_buried = $reader->readVarint($stream);

                continue;
            }

            $extensions = $context->getExtensionRegistry();
            $extension  = $extensions ? $extensions->findByNumber(__CLASS__, $tag) : null;

            if ($extension !== null) {
                $this->extensions()->put($extension, $extension->readFrom($context, $wire));

                continue;
            }

            if ($this->unknownFieldSet === null) {
                $this->unknownFieldSet = new \Protobuf\UnknownFieldSet();
            }

            $data    = $reader->readUnknown($stream, $wire);
            $unknown = new \Protobuf\Unknown($tag, $wire, $data);

            $this->unknownFieldSet->add($unknown);

        }
    }

    /**
     * {@inheritdoc}
     */
    public function serializedSize(\Protobuf\ComputeSizeContext $context)
    {
        $calculator = $context->getSizeCalculator();
        $size       = 0;

        if ($this->bones_buried !== null) {
            $size += 1;
            $size += $calculator->computeVarintSize($this->bones_buried);
        }

        if ($this->extensions !== null) {
            $size += $this->extensions->serializedSize($context);
        }

        return $size;
    }

    /**
     * {@inheritdoc}
     */
    public function clear()
    {
        $this->bones_buried = null;
    }


}

