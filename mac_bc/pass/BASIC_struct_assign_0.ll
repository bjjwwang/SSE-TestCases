; ModuleID = 'mac_bc/pass/BASIC_struct_assign_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_struct_assign_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.Struct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.Struct, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.Struct* %a, metadata !15, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %p, metadata !22, metadata !DIExpression()), !dbg !24
  %y = getelementptr inbounds %struct.Struct, %struct.Struct* %a, i32 0, i32 1, !dbg !25
  store i32* %y, i32** %p, align 8, !dbg !24
  %y1 = getelementptr inbounds %struct.Struct, %struct.Struct* %a, i32 0, i32 1, !dbg !26
  store i32 10, i32* %y1, align 4, !dbg !27
  %0 = load i32*, i32** %p, align 8, !dbg !28
  %1 = load i32, i32* %0, align 4, !dbg !29
  %cmp = icmp eq i32 %1, 10, !dbg !30
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_struct_assign_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 18, type: !11, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_struct_assign_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 19, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "Struct", file: !10, line: 16, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Struct", file: !10, line: 13, size: 64, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !17, file: !10, line: 14, baseType: !13, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !17, file: !10, line: 15, baseType: !13, size: 32, offset: 32)
!21 = !DILocation(line: 19, column: 12, scope: !9)
!22 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 20, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!24 = !DILocation(line: 20, column: 10, scope: !9)
!25 = !DILocation(line: 20, column: 17, scope: !9)
!26 = !DILocation(line: 21, column: 7, scope: !9)
!27 = !DILocation(line: 21, column: 9, scope: !9)
!28 = !DILocation(line: 22, column: 17, scope: !9)
!29 = !DILocation(line: 22, column: 16, scope: !9)
!30 = !DILocation(line: 22, column: 19, scope: !9)
!31 = !DILocation(line: 22, column: 5, scope: !9)
!32 = !DILocation(line: 23, column: 5, scope: !9)
