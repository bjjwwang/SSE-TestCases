; ModuleID = 'mac_bc/pass/cwe121_struct_alloc.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_struct_alloc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !18 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 32, align 16, !dbg !26
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !27
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !25
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !28
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 0, !dbg !30
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !31
  store i32 10, i32* %intOne, align 4, !dbg !32
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 1, !dbg !33
  %intOne2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 0, !dbg !34
  store i32 11, i32* %intOne2, align 4, !dbg !35
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 2, !dbg !36
  %intOne4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 0, !dbg !37
  store i32 12, i32* %intOne4, align 4, !dbg !38
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 1, !dbg !39
  %intOne6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 0, !dbg !40
  %7 = load i32, i32* %intOne6, align 4, !dbg !40
  %cmp = icmp eq i32 %7, 11, !dbg !41
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !42
  ret i32 0, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe121_struct_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 11, baseType: !6)
!5 = !DIFile(filename: "src/pass/cwe121_struct_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 7, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 9, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 10, baseType: !9, size: 32, offset: 32)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 13, type: !19, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!9}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !5, line: 14, type: !3)
!23 = !DILocation(line: 14, column: 21, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !5, line: 15, type: !3)
!25 = !DILocation(line: 15, column: 21, scope: !18)
!26 = !DILocation(line: 15, column: 54, scope: !18)
!27 = !DILocation(line: 15, column: 37, scope: !18)
!28 = !DILocation(line: 18, column: 12, scope: !18)
!29 = !DILocation(line: 18, column: 10, scope: !18)
!30 = !DILocation(line: 19, column: 5, scope: !18)
!31 = !DILocation(line: 19, column: 13, scope: !18)
!32 = !DILocation(line: 19, column: 20, scope: !18)
!33 = !DILocation(line: 20, column: 5, scope: !18)
!34 = !DILocation(line: 20, column: 13, scope: !18)
!35 = !DILocation(line: 20, column: 20, scope: !18)
!36 = !DILocation(line: 21, column: 5, scope: !18)
!37 = !DILocation(line: 21, column: 13, scope: !18)
!38 = !DILocation(line: 21, column: 20, scope: !18)
!39 = !DILocation(line: 22, column: 16, scope: !18)
!40 = !DILocation(line: 22, column: 24, scope: !18)
!41 = !DILocation(line: 22, column: 31, scope: !18)
!42 = !DILocation(line: 22, column: 5, scope: !18)
!43 = !DILocation(line: 23, column: 1, scope: !18)
