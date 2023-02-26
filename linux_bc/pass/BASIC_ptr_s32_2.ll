; ModuleID = 'linux_bc/pass/BASIC_ptr_s32_2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_s32_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.a = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %a = alloca [3 x i32], align 4
  %p = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !16, metadata !DIExpression()), !dbg !20
  %0 = bitcast [3 x i32]* %a to i8*, !dbg !20
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %0, i8* align 4 bitcast ([3 x i32]* @__const.main.a to i8*), i64 12, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %p, metadata !21, metadata !DIExpression()), !dbg !22
  %1 = alloca i8, i64 16, align 16, !dbg !23
  %2 = bitcast i8* %1 to i32*, !dbg !24
  store i32* %2, i32** %p, align 8, !dbg !22
  %3 = load i32*, i32** %p, align 8, !dbg !25
  %4 = bitcast i32* %3 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !26
  %5 = bitcast i32* %arraydecay to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 4 %5, i64 12, i1 false), !dbg !26
  ret i32 0, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_ptr_s32_2.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 9, type: !14, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/pass/BASIC_ptr_s32_2.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 10, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 96, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 3)
!20 = !DILocation(line: 10, column: 9, scope: !12)
!21 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 11, type: !4)
!22 = !DILocation(line: 11, column: 10, scope: !12)
!23 = !DILocation(line: 11, column: 21, scope: !12)
!24 = !DILocation(line: 11, column: 14, scope: !12)
!25 = !DILocation(line: 12, column: 12, scope: !12)
!26 = !DILocation(line: 12, column: 5, scope: !12)
!27 = !DILocation(line: 13, column: 1, scope: !12)
