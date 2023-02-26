; ModuleID = 'mac_bc/pass/BASIC_ptr_s32_2.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_s32_2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %a = alloca [3 x i32], align 4
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !17, metadata !DIExpression()), !dbg !21
  %0 = bitcast [3 x i32]* %a to i8*, !dbg !21
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %p, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 16, align 16, !dbg !24
  %2 = bitcast i8* %1 to i32*, !dbg !25
  store i32* %2, i32** %p, align 8, !dbg !23
  %3 = load i32*, i32** %p, align 8, !dbg !26
  %4 = bitcast i32* %3 to i8*, !dbg !27
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !27
  %5 = bitcast i32* %arraydecay to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 12, i1 false), !dbg !27
  ret i32 0, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_ptr_s32_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 9, type: !14, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/pass/BASIC_ptr_s32_2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!4}
!16 = !{}
!17 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 10, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 3)
!21 = !DILocation(line: 10, column: 9, scope: !12)
!22 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 11, type: !3)
!23 = !DILocation(line: 11, column: 10, scope: !12)
!24 = !DILocation(line: 11, column: 21, scope: !12)
!25 = !DILocation(line: 11, column: 14, scope: !12)
!26 = !DILocation(line: 12, column: 12, scope: !12)
!27 = !DILocation(line: 12, column: 5, scope: !12)
!28 = !DILocation(line: 13, column: 1, scope: !12)
