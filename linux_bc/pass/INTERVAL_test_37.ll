; ModuleID = 'linux_bc/pass/INTERVAL_test_37.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_37.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.testStruct = type { i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca %struct.testStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.testStruct** %i, metadata !14, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 16) #4, !dbg !20
  %0 = bitcast i8* %call to %struct.testStruct*, !dbg !20
  store %struct.testStruct* %0, %struct.testStruct** %i, align 8, !dbg !19
  %1 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !21
  %arrayidx = getelementptr inbounds %struct.testStruct, %struct.testStruct* %1, i64 3, !dbg !21
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx, i32 0, i32 0, !dbg !23
  %2 = load i32, i32* %a, align 4, !dbg !23
  %cmp = icmp sgt i32 %2, 5, !dbg !24
  br i1 %cmp, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %3 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !26
  %arrayidx1 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %3, i64 3, !dbg !26
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx1, i32 0, i32 0, !dbg !28
  %4 = load i32, i32* %a2, align 4, !dbg !28
  %cmp3 = icmp sgt i32 %4, 5, !dbg !29
  call void @svf_assert(i1 zeroext %cmp3), !dbg !30
  br label %if.end, !dbg !31

if.else:                                          ; preds = %entry
  %5 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !32
  %arrayidx4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %5, i64 3, !dbg !32
  %a5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx4, i32 0, i32 0, !dbg !34
  %6 = load i32, i32* %a5, align 4, !dbg !34
  %cmp6 = icmp sle i32 %6, 5, !dbg !35
  call void @svf_assert(i1 zeroext %cmp6), !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %retval, align 4, !dbg !37
  ret i32 %7, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_37.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_37.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 13, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 8, size: 32, elements: !17)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !16, file: !10, line: 9, baseType: !13, size: 32)
!19 = !DILocation(line: 13, column: 24, scope: !9)
!20 = !DILocation(line: 13, column: 28, scope: !9)
!21 = !DILocation(line: 14, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 9)
!23 = !DILocation(line: 14, column: 14, scope: !22)
!24 = !DILocation(line: 14, column: 16, scope: !22)
!25 = !DILocation(line: 14, column: 9, scope: !9)
!26 = !DILocation(line: 15, column: 20, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !10, line: 14, column: 21)
!28 = !DILocation(line: 15, column: 25, scope: !27)
!29 = !DILocation(line: 15, column: 27, scope: !27)
!30 = !DILocation(line: 15, column: 9, scope: !27)
!31 = !DILocation(line: 16, column: 5, scope: !27)
!32 = !DILocation(line: 18, column: 20, scope: !33)
!33 = distinct !DILexicalBlock(scope: !22, file: !10, line: 17, column: 10)
!34 = !DILocation(line: 18, column: 25, scope: !33)
!35 = !DILocation(line: 18, column: 27, scope: !33)
!36 = !DILocation(line: 18, column: 9, scope: !33)
!37 = !DILocation(line: 20, column: 1, scope: !9)
