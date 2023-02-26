; ModuleID = 'mac_bc/pass/INTERVAL_test_37.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_37.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.testStruct = type { i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca %struct.testStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.testStruct** %i, metadata !15, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 16) #4, !dbg !21
  %0 = bitcast i8* %call to %struct.testStruct*, !dbg !21
  store %struct.testStruct* %0, %struct.testStruct** %i, align 8, !dbg !20
  %1 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !22
  %arrayidx = getelementptr inbounds %struct.testStruct, %struct.testStruct* %1, i64 3, !dbg !22
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx, i32 0, i32 0, !dbg !24
  %2 = load i32, i32* %a, align 4, !dbg !24
  %cmp = icmp sgt i32 %2, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %3 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !27
  %arrayidx1 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %3, i64 3, !dbg !27
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx1, i32 0, i32 0, !dbg !29
  %4 = load i32, i32* %a2, align 4, !dbg !29
  %cmp3 = icmp sgt i32 %4, 5, !dbg !30
  call void @svf_assert(i1 noundef zeroext %cmp3), !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %5 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !33
  %arrayidx4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %5, i64 3, !dbg !33
  %a5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx4, i32 0, i32 0, !dbg !35
  %6 = load i32, i32* %a5, align 4, !dbg !35
  %cmp6 = icmp sle i32 %6, 5, !dbg !36
  call void @svf_assert(i1 noundef zeroext %cmp6), !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %retval, align 4, !dbg !38
  ret i32 %7, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare void @svf_assert(i1 noundef zeroext) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_37.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_37.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 13, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 8, size: 32, elements: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !17, file: !10, line: 9, baseType: !13, size: 32)
!20 = !DILocation(line: 13, column: 24, scope: !9)
!21 = !DILocation(line: 13, column: 28, scope: !9)
!22 = !DILocation(line: 14, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 9)
!24 = !DILocation(line: 14, column: 14, scope: !23)
!25 = !DILocation(line: 14, column: 16, scope: !23)
!26 = !DILocation(line: 14, column: 9, scope: !9)
!27 = !DILocation(line: 15, column: 20, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !10, line: 14, column: 21)
!29 = !DILocation(line: 15, column: 25, scope: !28)
!30 = !DILocation(line: 15, column: 27, scope: !28)
!31 = !DILocation(line: 15, column: 9, scope: !28)
!32 = !DILocation(line: 16, column: 5, scope: !28)
!33 = !DILocation(line: 18, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !23, file: !10, line: 17, column: 10)
!35 = !DILocation(line: 18, column: 25, scope: !34)
!36 = !DILocation(line: 18, column: 27, scope: !34)
!37 = !DILocation(line: 18, column: 9, scope: !34)
!38 = !DILocation(line: 20, column: 1, scope: !9)
