; ModuleID = 'linux_bc/pass/cwe121_int_alloc.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/cwe121_int_alloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = alloca i8, i64 16, align 16, !dbg !20
  %1 = bitcast i8* %0 to i32*, !dbg !21
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !19
  %2 = load i32*, i32** %dataBadBuffer, align 8, !dbg !22
  store i32* %2, i32** %data, align 8, !dbg !23
  %3 = load i32*, i32** %data, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 0, !dbg !24
  store i32 10, i32* %arrayidx, align 4, !dbg !25
  %4 = load i32*, i32** %data, align 8, !dbg !26
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 1, !dbg !26
  store i32 11, i32* %arrayidx1, align 4, !dbg !27
  %5 = load i32*, i32** %data, align 8, !dbg !28
  %arrayidx2 = getelementptr inbounds i32, i32* %5, i64 2, !dbg !28
  store i32 12, i32* %arrayidx2, align 4, !dbg !29
  %6 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 1, !dbg !30
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !30
  %cmp = icmp eq i32 %7, 11, !dbg !31
  call void @svf_assert(i1 zeroext %cmp), !dbg !32
  ret i32 0, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/cwe121_int_alloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/pass/cwe121_int_alloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 8, type: !4)
!17 = !DILocation(line: 8, column: 11, scope: !12)
!18 = !DILocalVariable(name: "dataBadBuffer", scope: !12, file: !13, line: 9, type: !4)
!19 = !DILocation(line: 9, column: 11, scope: !12)
!20 = !DILocation(line: 9, column: 34, scope: !12)
!21 = !DILocation(line: 9, column: 27, scope: !12)
!22 = !DILocation(line: 12, column: 12, scope: !12)
!23 = !DILocation(line: 12, column: 10, scope: !12)
!24 = !DILocation(line: 13, column: 5, scope: !12)
!25 = !DILocation(line: 13, column: 13, scope: !12)
!26 = !DILocation(line: 14, column: 5, scope: !12)
!27 = !DILocation(line: 14, column: 13, scope: !12)
!28 = !DILocation(line: 15, column: 5, scope: !12)
!29 = !DILocation(line: 15, column: 13, scope: !12)
!30 = !DILocation(line: 16, column: 16, scope: !12)
!31 = !DILocation(line: 16, column: 24, scope: !12)
!32 = !DILocation(line: 16, column: 5, scope: !12)
!33 = !DILocation(line: 17, column: 1, scope: !12)
