from wagtail.core import blocks
from wagtail.images.blocks import ImageChooserBlock

from webapp.website.blocks.base_struct_block import BaseStructBlock
from webapp.website.blocks.bg_color_choice_block import BgColorChoiceBlock
from webapp.website.blocks.headline_block import Display4Block, Display1Block, TitleBlock
from webapp.website.blocks.text_block import TextBlock


stream_block_choices = [
    ('headline', Display1Block()),
    ('text', TitleBlock()),
    ('image', ImageChooserBlock()),
]


class Layout3ColSection(BaseStructBlock):
    background_color = BgColorChoiceBlock(required=False)
    background_image = ImageChooserBlock(required=False)

    column_1 = blocks.StreamBlock(stream_block_choices, required=True)

    column_2 = blocks.StreamBlock(stream_block_choices, required=True)

    column_3 = blocks.StreamBlock(stream_block_choices, required=True)

    css_classes = blocks.CharBlock(required=False)

    class Meta:
        template = 'website/sections/layout_3_col_section.html'
