<div class="box" style="width: 243px;">
<div class="box-heading"><?php echo $heading_title; ?></div>
<div class="box-content"  id='menu-block' style="width: 225px;">
        <ul  class='vertical-menu'>
            <?php
            $this->load->model('catalog/category');
            $this->load->model('catalog/product');

            $categories_1 = $this->model_catalog_category->getCategories(0);
            $output = '';
            foreach ($categories_1 as $category_1) {

                    //Верхний уровень категорий

                    $categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
                    $output .= '<li ';
                    if ($categories_2) $output .= ' class="drop-link"';
                    $output .='>';

                    $unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id']);
                    $output .= '<a href="'.($unrewritten).'">' . $category_1['name'] . '</a>';


//                    if ($categories_2) $output .= '<ul  style="display:none" class="drop-block>';
                    if ($categories_2) $output .= '<ul class="drop-block">';

                    foreach ($categories_2 as $category_2) {
                                $categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

                                $output .= '<li';

                                if ($categories_3)
                                                    $output .= '  class="drop-link"';
                                $output .='>';

                                $sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' .$category_2['category_id']);
                                $output .= '<a href="'.($sub_unrewritten).' ">'. $category_2['name'] . '</a>';

                                if ($categories_3) $output .= '<ul class="drop-block" >';

                                foreach ($categories_3 as $category_3) {
                                        $output .= '<li>';
                                        $third_sub_unrewritten = $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_'
                                        . $category_2['category_id'] . '_' . $category_3['category_id']);
                                        $output .= '<a href="'.($third_sub_unrewritten).'">'.$category_3['name'].'</a>';
                                        $output .= '</li>';
                    }

                    if ($categories_3) {$output .= '</ul>';}
                    $output .= '</li>';
                    }
                    if ($categories_2) {$output .= '</ul>';}
                    $output .= '</li>';
            }
    //        if ($categories_1) {$output .= '</ul>';}
            echo $output;
            ?>
        </ul>
    </div>
</div>


