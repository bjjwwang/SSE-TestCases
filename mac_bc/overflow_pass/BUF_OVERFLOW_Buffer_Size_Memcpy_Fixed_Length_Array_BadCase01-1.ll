; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Fixed_Length_Array_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Fixed_Length_Array_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@cTestData = global [4 x i8] zeroinitializer, align 1, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !19 {
entry:
  %testDigestBuffer = alloca [2 x i8], align 1
  call void @llvm.dbg.declare(metadata [2 x i8]* %testDigestBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = bitcast [2 x i8]* %testDigestBuffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 2, i1 false), !dbg !28
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %testDigestBuffer, i64 0, i64 0, !dbg !29
  %call = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @cTestData, i64 0, i64 0), i64 noundef 4, i64 noundef 2) #4, !dbg !29
  ret i32 0, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "cTestData", scope: !2, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Fixed_Length_Array_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Memcpy_Fixed_Length_Array_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 32, elements: !10)
!9 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 8, type: !20, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!20 = !DISubroutineType(types: !21)
!21 = !{!22}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{}
!24 = !DILocalVariable(name: "testDigestBuffer", scope: !19, file: !7, line: 10, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 16, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 2)
!28 = !DILocation(line: 10, column: 10, scope: !19)
!29 = !DILocation(line: 13, column: 5, scope: !19)
!30 = !DILocation(line: 14, column: 1, scope: !19)
